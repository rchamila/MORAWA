/// <reference path="jquery.js" />

function init() {
    Gallery.init();
}

var Gallery = (function () {
    var getAlbums = function (pageIndex) {
        $.webMethod('getAlbums', {
            pageIndex: pageIndex
        }, populateAlbums, onFailure);
    };

    var populateAlbums = function (data) {
        var albumJson = $.parseJSON(data.d);
        var t = "";

        for (var i = 0, length = albumJson.length; i < length; i++) {
            var image = albumJson[i].ImageURLs.split(',')[0];
            t += '<div class="group_item group_item_gallery">';
            t += '<h2><a href="' + context + '/Gallery/Album.aspx?AI=' + albumJson[i].AlbumId + '">' + albumJson[i].Title + '</a></h2>';
            t += '<p><a href="' + context + '/Gallery/Album.aspx?AI=' + albumJson[i].AlbumId + '"><span class="gallery_image"><img src="' + context + '/Gallery/Albums/' + albumJson[i].AlbumId + '/thumb-' + image + '" class="img_frame" border="0" alt="our story" /></span></a>';
            t += albumJson[i].Description + '</p><br class="clear" /></div>';            
        }

        $('div#albumView').html(t);
    };

    function onFailure(data) {
        alert(data.Message + "\n" + data.StackTrace);
    };

    var bindEvents = function () {
        var pageSize = parseInt($("#pageSize").val());
        var totalAlbumsCount = parseInt($("#albumCount").val());

        if (totalAlbumsCount > pageSize) {
            var albumPageCount = Math.ceil(totalAlbumsCount / pageSize);

            $("#albumPagination").paginate({
                count: albumPageCount,
                start: 1,
                display: 5,
                border: false,
                text_color: 'none',
                background_color: 'none',
                text_hover_color: 'none',
                background_hover_color: 'none',
                onChange: function (pageIndex) {
                    var nextPageId = (parseInt(pageIndex, 10) - 1);
                    getAlbums(nextPageId.toString(10));
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