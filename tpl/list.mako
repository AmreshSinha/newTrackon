<%inherit file="base.mako"/>
<script>
$('button').tooltip({
  trigger: 'click',
  placement: 'bottom'
});
function setTooltip(btn, message) {
  $(btn).tooltip('hide')
    .attr('data-original-title', message)
    .tooltip('show');
}
function hideTooltip(btn) {
  setTimeout(function() {
    $(btn).tooltip('hide');
  }, 1000);
}
var clipboard = new Clipboard('button');

clipboard.on('success', function(e) {
  setTooltip(e.trigger, 'Copied!');
  hideTooltip(e.trigger);
});

clipboard.on('error', function(e) {
  setTooltip(e.trigger, 'Failed!');
  hideTooltip(e.trigger);
});
</script>
<div class="container">
  <h2>List of stable trackers</h2>
  <p>This is a list of the <b>${size}</b> trackers with more than 95% of uptime, considered stable. You can copy the list and add it to your torrents or directly to your BitTorrent client.</p>
  <p><button class="btn btn-primary" data-clipboard-action="copy" data-clipboard-target="#tocopy">Copy ${size} trackers to clipboard </button><p>
    <div id="list">
      <pre id="tocopy">${stable}</pre>
    </div>
  </div>
<%def name="title()">Stable Trackers List - newTrackon</%def>
