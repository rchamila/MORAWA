/// <reference path="jquery.js" />
function init() {
    NewsAndEvents.init();
}

var NewsAndEvents = (function () {
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
        var pageSize = parseInt($("#pageSize").val());
        var totalNewsCount = parseInt($("#newsCount").val());

        if (totalNewsCount > pageSize) {
            var newsPageCount = Math.ceil(totalNewsCount / pageSize);

            $("#newsPagination").paginate({
                count: newsPageCount,
                start: 1,
                display: 5,
                border: false,
                text_color: 'none',
                background_color: 'none',
                text_hover_color: 'none',
                background_hover_color: 'none',
                onChange: function (pageIndex) {
                    var nextPageId = (parseInt(pageIndex, 10) - 1);
                    getNews(nextPageId.toString(10));
                }
            });
        }

    };

    return {
        init: function () {
            bindEvents();
        }
    };
})();

