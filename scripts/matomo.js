var matomoTrackingApiUrl = 'https://stats.deuchnord.fr/matomo.php';
var idSite = 3;

var _paq = window._paq = window._paq || [];  
_paq.push(['setTrackerUrl', matomoTrackingApiUrl]);
_paq.push(['setSiteId', idSite]);
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);
