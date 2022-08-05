$( document ).on('turbolinks:load', function() {
  $(document).ready(function(){
    $(document).on('click', '.delete_author', function(e){
      e.preventDefault();
      let urlRequest = $(this).data('url');
      let that = $(this);
      Swal.fire({
        title: I18n.alert.check,
        text: I18n.alert.check,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: I18n.alert.yes_delete,
        cancelButtonText: I18n.alert.cancel
      }).then((result) => {
        if (result.value) {
          $.ajax({
            type: 'DELETE',
            dataType: 'json',
            url: urlRequest,
            success: function (data) {
              if (data.code == 200) {
                if ((that.parent().parent().prev().get().length
                  + that.parent().parent().next().get().length) === 0){
                  let searchParams = new URLSearchParams(window.location.search)
                  let page = searchParams.get('page')
                  page == 1
                  ? location.href = location.origin + location.pathname
                  : location.href = location.origin + location.pathname + `?page=${page-1}`
                }
                that.parent().parent().remove();
                alertSuccess(data.message, I18n.alert.delete_icon);
              }
            },
            error: function () {
              alertError(data.message);
            }
          });
        }
      })
    })

    $(document).on('change', '#author_image', function(event) {
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        img.src = file.target.result;
        $('#author_image_preview').html(img);
      }
      reader.readAsDataURL(image);
    });

    function alertError(){
      Swal.fire({
        icon: 'Error',
        title: I18n.alert.error,
      })
    }

    function alertSuccess(message, title){
      Swal.fire(
        title,
        message,
        'success'
      )
    }
  });
});
