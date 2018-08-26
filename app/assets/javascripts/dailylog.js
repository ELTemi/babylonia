$(document).ready(function() {
  addEventListeners()
});



function addEventListeners() {
  $(".js-more").click(function() {
    var moreText = $(".js-more").text()
    if (moreText === "Hide Logs") {
      showMoreLogs()
      $("#babyLogs").hide()
    } else {
      showMoreLogs()
      $("#babyLogs").show()
    }
  })
}


function showMoreLogs() {
  var babyId = $('#baby-id').attr('data-baby-id')
  $.getJSON("/babies/" + babyId + "/dailylogs", function(data) {
    const logs = data
    logData(logs)
  })
}

function logData(logs) {
  var logsList = ""
  var moreText = $(".js-more").text()

  logs.forEach(function(log) {
    logsList +=

    '<h3>' + '<strong>' + log["date_format_for_time_in"] + '</strong>' + '</h3>' +

    '<strong>Time In: </strong>' +  log["time_in_format"] + '<br>' +
    '<strong>Naps: </strong>' + log["nap"] + ' times' + '<br>' +
    '<strong>Meal: </strong>' + log["meal"] + ' times' +  '<br>' +
    '<strong>Diaper Changes: </strong>' + log["diaper"] + ' times' + '<br>' +
    '<strong>Meds: </strong>' + log["meds"] + '<br>' +
    '<strong>Playtime: </strong>' + log["play_time"] + ' times' +  '<br>' +
    '<strong>Summary: </strong>' + log["summary"] + '<br>' +
    '<strong>Time Out: </strong>' + log["time_out_format"] + '<br>'
  })

  $("div#babyLogs").empty();
  $("div#babyLogs").append(logsList)
  if (moreText === "Hide Logs") {
    $(".js-more").text("More Logs")
  } else {
    $(".js-more").text("Hide Logs")
  }

}
