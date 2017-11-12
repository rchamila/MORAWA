/// <reference path="jquery.js" />
function init() {
    ContactUs.init();
}

var ContactUs = (function () {
    var getNews = function (pageIndex) {
        $.webMethod('getNews', {
            pageIndex: pageIndex
        }, populateNews, onFailure);
    };

    var populateNews = function (data) {
        var newsJson = $.parseJSON(data.d);
        var t = "";

        for (var i = 0, length = newsJson.length; i < length; i++) {
            t += '<li><a href="' + context + '/News_And_Events/NewsAndEventsDetails.aspx?NI=' + newsJson[i].NewsId + '">' + newsJson[i].Title + '</a></li>';
        }

        $('ul#newsHeadlines').html(t);
    };

    function onFailure(data) {
        alert(data.Message + "\n" + data.StackTrace);
    };

    var bindEvents = function () {
       
    };

    return {
        init: function () {
            bindEvents();
        }
    };
})();

