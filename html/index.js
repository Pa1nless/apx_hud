window.addEventListener('message', function(event) {
    if (event.data.armour >= 1) {
        $("#shield").slideDown();
    } else if (event.data.armour == 0) {
        $("#shield").slideUp();
    }

    if (event.data.o2 >= 100) {
        $('#o22').slideUp();
    } else if (event.data.o2 <= 100) {
        $('#o22').slideDown();
    }

    switch (event.data.action) {
        case 'tick':
            $(".vida").css("height", event.data.health + "%");
            $(".shield").css("height", event.data.armour + "%");
            $(".thirst").css("height", event.data.thirst + "%");
            $(".hunger").css("height", event.data.hunger + "%");
            $(".stamina").css("height", event.data.stamina + "%");
            $(".o22").css("height", event.data.o2 + "%");
            break
    }
});
