$(document).ready(function() {
  addEventListenersForBaby()
});


function addEventListenersForBaby() {
  $('form#new_baby.new_baby').submit(function(event) {
    event.preventDefault();
    var values = $(this).serialize();
    var posting = $.post('/babies', values);
    posting.done(function(data) {
      var baby = new Baby(data)
      baby.babyInfo()
    })
    clearForm()
  });



  $(".js-next-baby").click(() => showNextBaby())
}

/*$("#babyName").text(baby["name"]) + " - " + $("a#babyLogs").text("See all Logs for " + baby["name"]) + $("a#babyLogs").href("/babies/" + baby["id"] + "/dailylogs")
*/

function showNextBaby() {
  $.get("/babies" + ".json", function(data) {
    for (i= 0; i < data.length; i++) {
      var nextId = data[i].id
      $.get("/babies/" + nextId + "/baby",  function(data) {
        var logs = data["dailylogs"]
        var logsList = ""

          $(".babyName").text("Hi, " + data["name"])
          $("#babyName").text("Baby Name: " + data["name"])
          $("img").attr("src", data["avatar"])
          $("#babyContact").text("Emergency Contact: " + data["emergency_contact"])
          $("#babySex").text("Sex: " + data["sex"])
          $("#babyAllergies").text("Allergies: " + data["allergies"])
          $("#babyDOB").text("Date of Birth: " + data["dob"])
          $("#editBaby a").attr("href", `/babies/${data["id"]}/edit`)
          $("#editBaby a").text("Edit " + data["name"] + " Profile")
          $("h3#babyMom").empty()
          $("button.js-more").empty()
          $("h4.logs-js").empty()
          $("p.logs-js").text("Logs")
          $(".js-next-baby").attr("data-id", data["id"]);

          logs.forEach(function(log) {
            logsList +=

            '<li>' + '<strong>' + log["date_format_for_time_in"] + '</strong>'+ '<br>' +

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

      })
    }
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
  $("#babyName").text(`New Baby has been sucessfully Created:
    Name: ${this.name}
    Sex: ${this.sex}
    Date of Birth: ${this.dob}
    Emergency Contact: ${this.emergency_contact}`)
};
