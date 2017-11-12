$(document).ready(function () {
    Master.init();
    if (typeof init != "undefined") {
        init();
    }
});

jQuery(function ($) {
    $.extend({
        webMethod: function (method, data, onSuccess, onFail) {
            var loc = window.location.href.split('?')[0];
            if (loc.substr(loc.length - 1, 1) == "/")
                loc = loc + "Default.aspx";

            // Serialize the data object with no whitespace 
            // (.NET requirement)
            var pairs = [];
            for (var i in data) {
                pairs.push(i + ':' + data[i]);
            }
            data = '{' + pairs.join(',') + '}';

            // Perform the post operation 
            $.ajax({
                type: "POST"
                , url: loc + "/" + method
                , 'data': data
                , contentType: "application/json; charset=utf-8"
                , dataType: "json"
                , success: onSuccess
                , error: function (jqXHR, textStatus, errorThrown) {
                    // The .NET error and stacktrace is hidden 
                    // inside the XMLHttpRequest response
                    if ($.isFunction(onFail))
                        onFail($.parseJSON(jqXHR.response));
                }
            });
        }
    });
});

var Master = (function () {
    var watermark = 'Search the site..';

    var bindEvents = function () {
        //init, set watermark text and class
        $('#siteSearch').val(watermark).addClass('watermark');

        //if blur and no value inside, set watermark text and class again.
        $('#siteSearch').blur(function () {
            if ($(this).val().length == 0) {
                $(this).val(watermark).addClass('watermark');
            }
        });

        //if focus and text is watermrk, set it to empty and remove the watermark class
        $('#siteSearch').focus(function () {
            if ($(this).val() == watermark) {
                $(this).val('').removeClass('watermark');
            }
        });

        var isShow = false;
        $("input.h_search_btn").bind('click', function (e) {
            var loginBtnPosition = $(this).offset();
            var distance = $(this).height();
            var time = 400;
            var div = $('div#searchPanel');
            if (div.css('display') !== "block") {
                div.css('display', 'block');
                div.css({ "left": (loginBtnPosition.left + $(this).width() - $(div).width()), "top": loginBtnPosition.top });
                div.animate({
                    top: '+=' + distance + 'px',
                    opacity: 1
                }, time, 'swing', function () {
                    beingShown = false;
                    shown = true;
                    isShow = true;
                });
            } else if (div.css('display') === "block") {
                div.animate({
                    top: '-=' + distance + 'px',
                    opacity: 0
                }, time, 'swing', function () {
                    shown = true;
                    div.css('display', 'none');
                    isShow = false;
                });
            }
            e.stopPropagation();
        });

        $('body').bind('click', function () {
            if (isShow) {
                $("input.h_search_btn").trigger('click');
            }
        });

        $('input#siteSearch').bind('click', function (e) {
            e.stopPropagation();
        });

        $('div#searchPanel').bind('click', function (e) {
            e.stopPropagation();
        });
    };

    var initMenu = function () {
        var currentPageId = $("input#pageId").val();
        $("#" + currentPageId).addClass('act');
    };


    return {
        init: function () {
            bindEvents();
            initMenu();
        }
    };
})();