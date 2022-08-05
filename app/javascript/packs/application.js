import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Swal from 'sweetalert2/dist/sweetalert2.min.js'
window.Swal = Swal;
Rails.start()
require("login/jquery-3.2.1.min")
global.toastr = require("toastr")
require("login/animsition.min")
require("login/select2.min")
require("admin/sweetalert2.min")
//= require i18n
//= require i18n.js
//= require i18n/translations
require("login/main")
require("admin/index.min")

Turbolinks.start()
ActiveStorage.start()
