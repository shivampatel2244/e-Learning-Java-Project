$(function() {
    $("#wizard").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "fade",
        enableAllSteps: true,
        transitionEffectSpeed: 500,
        labels: {
            finish: "Submit",
            next: "Forward",
            previous: "Backward"
        },
        onFinished: function (event, currentIndex) {
            // Debugging statement to verify event is firing
            alert("onFinished event fired");

            // Redirect to the dummy page
            window.location.href = "../../Credit-Card-master/index.html";
            console.log("Successfully");
        }
    });

    $('.wizard > .steps li a').click(function() {
        $(this).parent().addClass('checked');
        $(this).parent().prevAll().addClass('checked');
        $(this).parent().nextAll().removeClass('checked');
    });

    // Custom jQuery Step Button
    $('.forward').click(function() {
        $("#wizard").steps('next');
    });

    $('.backward').click(function() {
        $("#wizard").steps('previous');
    });

    // Select Dropdown
    $('html').click(function() {
        $('.select .dropdown').hide();
    });

    $('.select').click(function(event) {
        event.stopPropagation();
    });

    $('.select .select-control').click(function() {
        $(this).parent().next().toggle();
    });

    $('.select .dropdown li').click(function() {
        $(this).parent().toggle();
        var text = $(this).attr('rel');
        $(this).parent().prev().find('div').text(text);
    });
});
