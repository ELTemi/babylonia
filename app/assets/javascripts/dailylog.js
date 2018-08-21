$(document).ready(function() {
  addEventListeners()
});

var clicks = 0


function addEventListeners() {
  $(".js-more").click(function() {
    if (clicks % 2 == 0) {
      showMoreLogs()
      $("#babyLogs").show();
    } else {
      showMoreLogs()
      $("#babyLogs").hide();
    }
    ++clicks;
  })
}


function showMoreLogs() {
  var babyId = $('#baby-id').attr('data-baby-id')
  if (babyId) {
    $.get("/babies/" + babyId + "/logs", function(data) {
      const logs = data
      logData(logs)
    })
  } else {
    $.get("/logs", function(data) {
      const logs = data
      logData()
    })
  }
}

function logData(logs) {
  var logsList = ""

  logs.forEach(function(log) {
    logsList +=

    '<button class="js-next"' + "data-id=" + `${log["id"]}` + '>' + log["date_format_for_time_in"] + '</button>' + '<br>' +

    '<strong>Time In: </strong>' +  log["time_in_format"] + '<br>' +
    '<strong>Naps: </strong>' + log["nap"] + ' times' + '<br>' +
    '<strong>Meal: </strong>' + log["meal"] + ' times' +  '<br>' +
    '<strong>Diaper Changes: </strong>' + log["diaper"] + ' times' + '<br>' +
    '<strong>Meds: </strong>' + log["meds"] + '<br>' +
    '<strong>Playtime: </strong>' + log["play_time"] + ' times' +  '<br>' +
    '<strong>Summary: </strong>' + log["summary"] + '<br>' +
    '<strong>Time Out: </strong>' + log["time_out_format"] + '<br>' +
    '</li>'
  })

  $("div#babyLogs").empty();
  $("div#babyLogs").append(logsList)
}
