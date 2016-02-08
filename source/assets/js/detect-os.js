/* jshint browser:true, jquery:true */

$(document).ready(function (navigator) {
    "use strict";

    var arch = navigator.userAgent.match(/x86_64|Win64|WOW64/) ||
               navigator.cpuClass === "x64" ? "x64" : "x86";
    var href = "https://binaries.mpc-hc.org/";
    var version = "{{ site.version.short }}";
    var element = $("#downloadButton");
    var buttonSubArchText = $(".button-sub span");
    var folder;

    if (arch === "x64") {
        folder = "MPC%20HomeCinema%20-%20x64";
        buttonSubArchText.text("64-bit");
    } else {
        folder = "MPC%20HomeCinema%20-%20Win32";
        buttonSubArchText.text("32-bit");
    }

    href += folder + "/MPC-HC_v" + version + "_" + arch + "/MPC-HC." + version + "." + arch + ".exe";

    element.attr("href", href);

}(navigator));
