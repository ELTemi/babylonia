$(document).ready(function() {
  addEventListenersForBaby()
});


function addEventListenersForBaby() {
  $('form#new_baby').submit(function(event) {
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/babies', values);
    posting.done(function(data) {
      var baby = new Baby(data)
      baby.babyInfo()
    })
    clearForm()
  });


  $(".js-next-baby").click(function(e) {
    e.preventDefault();
    showNextBaby();
  });
}


function showNextBaby() {
  var baby_id = $('#baby-id').attr('data-baby-id');
  $.get("/babies/" + baby_id + "/baby",  function(data) {
    var logs = data["dailylogs"]
    window.history.pushState(null, null, "/babies/" + data.id.toString());
    nextBabyShow(data)
    logShow(logs)
  })
}


function Baby(baby){
    this.name = baby.name
    this.sex = baby.sex
    this.dob = baby.dob
    this.avatar = baby.avatar
    this.allergies = baby.allergies
    this.emergency_contact = baby.emergency_contact
    this.caregiver = baby.caregiver.name
    this.mom = baby.mom.name
}

Baby.prototype.babyInfo = function () {
  $("#newBabyName").text(`New Baby's Profile has been sucessfully Created! Name: ${this.name}`)
  $("div#baby-link").append(`<a href="/babies/${this.id}">${this.name}</a> - <a href="/babies/${this.id}/dailylogs">See all Logs for ${this.name}</a>`)

  $("#newBabySex").text(`Sex: ${this.sex}`)
  $("#newBabyAllergies").text(`Date of Birth: ${this.dob}`)
  $("#newBabyEmergencyContact").text(`Emergency Contact: ${this.emergency_contact}`)
};

function clearForm() {
  $("#baby_name").val('')
  $("#baby_emergency_contact").val('')
  $("#baby_dob").val('')
  $("#baby_sex").val('')
  $("#baby_allergies").val('')
}

function logShow(logs) {

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
  };
}

function nextBabyShow(data) {
  $(".babyName").text("Hi, " + data["name"])
  $("#baby-id").attr("data-baby-id", data['id'])
  $("#babyName").text("Baby Name: " + data["name"])
  $("img").attr("src", data["avatar"])
  $("#babyContact").text("Emergency Contact: " + data["emergency_contact"])
  $("#babySex").text("Sex: " + data["sex"])
  $("#babyAllergies").text("Allergies: " + data["allergies"])
  $("#babyDOB").text("Date of Birth: " + data["dob"])
  $("#editBaby a").attr("href", `/babies/${data["id"]}/edit`)
  $("#editBaby a").text("Edit " + data["name"] + " Profile")
  $("h3#babyMom").empty()
}
