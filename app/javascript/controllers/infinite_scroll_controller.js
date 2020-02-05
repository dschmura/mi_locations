import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "scrollContainer", "viewMore" ]

  // content = $('#classroom_cards')    # where to load new content
  // let content = this.scrollContainerTarget
  // let viewMore = this.viewMoreTarget
  // viewMore = $('#view-more') # tag containing the "View More" link

  // let isLoadingNextPage = false  # keep from loading two pages at once
  // let lastLoadAt = null          # when you loaded the last page
  // let minTimeBetweenPages = 100 # milliseconds to wait between loading pages
  // let loadNextPageAt = 100      # pixels above the bottom

  initialize(){


  }

  canary(){
    console.log("Hi")
  }

  waitedLongEnoughBetweenPages() {
    return lastLoadAt === null || new Date() - lastLoadAt > minTimeBetweenPages;
  };


}


// (function() {
//   $(function() {
//     var approachingBottomOfPage, content, isLoadingNextPage, lastLoadAt, loadNextPageAt, minTimeBetweenPages, nextPage, viewMore, waitedLongEnoughBetweenPages;
//     content = $('#classroom_cards');
//     viewMore = $('#view-more');
//     isLoadingNextPage = false;
//     lastLoadAt = null;
//     minTimeBetweenPages = 100;
//     loadNextPageAt = 100;
//     waitedLongEnoughBetweenPages = function() {
//       return lastLoadAt === null || new Date() - lastLoadAt > minTimeBetweenPages;
//     };
//     approachingBottomOfPage = function() {
//       return document.documentElement.clientHeight + $(document).scrollTop() < document.body.offsetHeight - loadNextPageAt;
//     };
//     nextPage = function() {
//       var url;
//       url = viewMore.find('a').attr('href');
//       if (isLoadingNextPage || !url) {
//         return;
//       }
//       viewMore.addClass('loading');
//       isLoadingNextPage = true;
//       lastLoadAt = new Date();
//       return $.ajax({
//         url: url,
//         method: 'GET',
//         dataType: 'script',
//         success: function() {
//           viewMore.removeClass('loading');
//           isLoadingNextPage = false;
//           return lastLoadAt = new Date();
//         }
//       });
//     };
//     $(window).scroll(function() {
//       if (approachingBottomOfPage() && waitedLongEnoughBetweenPages()) {
//         return nextPage();
//       }
//     });
//     return viewMore.find('a').click(function(e) {
//       nextPage();
//       return e.preventDefaults();
//     });
//   });

// }).call(this);