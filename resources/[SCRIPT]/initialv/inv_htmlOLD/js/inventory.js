var type = "normal";
var disabled = false;
var disabledFunction = null;

window.addEventListener("message", function(event) {
    if (event.data.action == "display") {
        type = event.data.type
        disabled = false;

        if (type === "normal") {
            $(".info-div").show();
        } else if (type === "trunk") {
            $(".info-div").show();
        } else if (type === "property") {
            $(".info-div").show();
        } else if (type === "glovebox") {
            $(".info-div").show();
        } else if (type === "player") {
            $(".info-div").show();
        }

        $(".ui").fadeIn();
    } else if (event.data.action == "hide") {
        $("#dialog").dialog("close");
        $(".ui").fadeOut();
        $(".item").remove();
        $("#otherInventory").html("<div id=\"noSecondInventoryMessage\"></div>");
        $("#noSecondInventoryMessage").html(invLocale.secondInventoryNotAvailable);
    } else if (event.data.action == "setItems") {
        inventorySetup(event.data.itemList);

        $('.item').dblclick(function() {
            
            itemData = $(this).data("item");

            /*if (itemData == undefined || itemData.usable == undefined) {
                return;
            }*/

            /*if (itemInventory == undefined || itemInventory == "second") {
                return;
            }*/

            /*if (itemData.usable) {
                disableInventory(300);
                $.post("http://initialv/UseItem", JSON.stringify({
                    item: itemData
                }));
            }*/

            disableInventory(300);
            $.post("http://initialv/UseItem", JSON.stringify({
                item: itemData
            }));
        });

        $('.item').draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            start: function(event, ui) {
                if (disabled) {
                    return false;
                }

                $(this).css('background-image', 'none');
                itemData = $(this).data("item");
                itemInventory = $(this).data("inventory");

                if (itemInventory == "second" || !itemData.canRemove) {
                    $("#drop").addClass("disabled");
                    $("#give").addClass("disabled");
                }

                if (itemInventory == "second" || !itemData.usable) {
                    $("#use").addClass("disabled");
                }
            },
            stop: function() {
                itemData = $(this).data("item");

                if (itemData !== undefined && itemData.ID !== undefined) {
                    $(this).css('background-image', 'url(\'img/items/' + itemData.ID + '.png\'');
                    $("#drop").removeClass("disabled");
                    $("#use").removeClass("disabled");
                    $("#give").removeClass("disabled");
                }
            }
        });

    } else if (event.data.action == "setSecondInventoryItems") {
        secondInventorySetup(event.data.itemList);
    } else if (event.data.action == "setInfoText") {
        $(".info-div").html(event.data.text);
    } else if (event.data.action == "setPoidsPl") {
        $(".info-div").html(event.data.PoidsPl);
    } else if (event.data.action == "nearPlayers") {
        $("#nearPlayers").html("");

        $.each(event.data.players, function(index, player) {
            $("#nearPlayers").append('<button class="nearbyPlayerButton" data-player="' + player.player + '">' + player.label + ' (' + player.player + ')</button><br>');
        });

        $("#dialog").dialog("open");

        $(".nearbyPlayerButton").click(function() {
            $("#dialog").dialog("close");
            player = $(this).data("player");
            $.post("http://initialv/GiveItem", JSON.stringify({
                player: player,
                item: event.data.item,
                number: parseInt($("#count").val())
            }));
        });
    }
});

function closeInventory() {
    $.post("http://initialv/NUIFocusOff", JSON.stringify({}));
}

function inventorySetup(items) {
    $("#playerInventory").html("");
    $.each(items, function(index, item) {
        count = setCount(item);

        if (item.Nombre > 0) {
            if (item.Data == null) {
                $("#playerInventory").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.ID + '.png\')">' +
                '<div class="item-count">' + count + '</div> <div class="item-name">' + item.Nom + '</div> </div ><div class="item-name-bg"></div></div>');
            } else {
                var itemid = item.ID.substr(0, 7);
                if (itemid == 'CarteCr') {
                    itemid = 'cartecredit';
                    var IData = item.Data
                } else if (itemid == 'CleVoit') {
                    var IData = item.Data
                } else if (itemid == 'Vetemen') {
                    if (item.Data.Type == 'Haut') {
                        itemid = 'vet_haut';
                    }
                    if (item.Data.Type == 'T-Shirt') {
                        itemid = 'vet_tshirt';
                    }
                    if (item.Data.Type == 'Gants') {
                        itemid = 'vet_gants';
                    }
                    var IData = item.Data.Type
                }
                $("#playerInventory").append('<div class="slot"><div id="item-' + index + '" class="item" style = "background-image: url(\'img/items/' + itemid + '.png\')">' +
                '<div class="item-count">' + count + '</div> <div class="item-name">' + item.Nom + '</div> <div class="item-data">' + '(' + IData + ')' + '</div> </div ><div class="item-name-bg"></div></div>');
            }

        $('#item-' + index).data('item', item);
        $('#item-' + index).data('inventory', "main");
        }
    });
}

function secondInventorySetup(items) {
    $("#otherInventory").html("");
    $.each(items, function(index, item) {
        count = setCount(item);

        if (item.Nombre > 0) {
        $("#otherInventory").append('<div class="slot"><div id="itemOther-' + index + '" class="item" style = "background-image: url(\'img/items/' + item.Nom + '.png\')">' +
            '<div class="item-count">' + count + '</div> <div class="item-name">' + item.Nom + '</div> </div ><div class="item-name-bg"></div></div>');
        $('#itemOther-' + index).data('item', item);
        $('#itemOther-' + index).data('inventory', "second");
        }
    });
}

function Interval(time) {
    var timer = false;
    this.start = function() {
        if (this.isRunning()) {
            clearInterval(timer);
            timer = false;
        }

        timer = setInterval(function() {
            disabled = false;
        }, time);
    };
    this.stop = function() {
        clearInterval(timer);
        timer = false;
    };
    this.isRunning = function() {
        return timer !== false;
    };
}

function disableInventory(ms) {
    disabled = true;

    if (disabledFunction === null) {
        disabledFunction = new Interval(ms);
        disabledFunction.start();
    } else {
        if (disabledFunction.isRunning()) {
            disabledFunction.stop();
        }

        disabledFunction.start();
    }
}

function setCount(item) {
    count = item.Nombre

    /*if (item.limit > 0) {
        count = item.Nombre + " / " + item.limit
    }

    if (item.type === "item_weapon") {
        if (count == 0) {
            count = "";
        } else {
            count = '<img src="img/bullet.png" class="ammoIcon"> ' + item.Nombre;
        }
    }

    if (item.type === "item_account" || item.type === "item_money") {
        count = formatMoney(item.Nombre);
    }*/

    return count;
}

function formatMoney(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;

    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t);
};

$(document).ready(function() {
    $("#count").focus(function() {
        $(this).val("")
    }).blur(function() {
        if ($(this).val() == "") {
            $(this).val("1")
        }
    });

    $("body").on("keyup", function(key) {
        if (Config.closeKeys.includes(key.which)) {
            closeInventory();
        }
    });

    $('#use').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {
            itemData = ui.draggable.data("item");

            /*if (itemData == undefined || itemData.usable == undefined) {
                return;
            }*/

            itemInventory = ui.draggable.data("inventory");

            /*if (itemInventory == undefined || itemInventory == "second") {
                return;
            }*/

            /*if (itemData.usable) {
                disableInventory(300);
                $.post("http://initialv/UseItem", JSON.stringify({
                    item: itemData
                }));
            }*/

            disableInventory(300);
            $.post("http://initialv/UseItem", JSON.stringify({
                item: itemData
            }));
        }
    });

    $('#give').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {
            itemData = ui.draggable.data("item");

            /*if (itemData == undefined || itemData.canRemove == undefined) {
                return;
            }*/

            itemInventory = ui.draggable.data("inventory");

            /*if (itemInventory == undefined || itemInventory == "second") {
                return;
            }*/

            /*if (itemData.canRemove) {
                disableInventory(300);
                $.post("http://initialv/GetNearPlayers", JSON.stringify({
                    item: itemData
                }));
            }*/

            disableInventory(300);
            $.post("http://initialv/GetNearPlayers", JSON.stringify({
                item: itemData
            }));
        }
    });

    $('#drop').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {
            itemData = ui.draggable.data("item");

            /*if (itemData == undefined || itemData.canRemove == undefined) {
                return;
            }*/

            itemInventory = ui.draggable.data("inventory");

            /*if (itemInventory == undefined || itemInventory == "second") {
                return;
            }*/

            /*if (itemData.canRemove) {
                disableInventory(300);
                $.post("http://initialv/DropItem", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            }*/

            disableInventory(300);
            $.post("http://initialv/DropItem", JSON.stringify({
                item: itemData,
                number: parseInt($("#count").val())
            }));
        }
    });

    $('#playerInventory').droppable({
        drop: function(event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if (type === "trunk" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://initialv/TakeFromTrunk", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "property" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://initialv/TakeFromProperty", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "glovebox" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://initialv/TakeFromGlovebox", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "player" && itemInventory === "second") {
                disableInventory(500);
                $.post("http://initialv/TakeFromPlayer", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            }
        }
    });

    $('#otherInventory').droppable({
        drop: function(event, ui) {
            itemData = ui.draggable.data("item");
            itemInventory = ui.draggable.data("inventory");

            if (type === "trunk" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://initialv/PutIntoTrunk", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "property" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://initialv/PutIntoProperty", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "glovebox" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://initialv/PutIntoGlovebox", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            } else if (type === "player" && itemInventory === "main") {
                disableInventory(500);
                $.post("http://initialv/PutIntoPlayer", JSON.stringify({
                    item: itemData,
                    number: parseInt($("#count").val())
                }));
            }
        }
    });

    $("#count").on("keypress keyup blur", function(event) {
        $(this).val($(this).val().replace(/[^\d].+/, ""));
        if ((event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
});

$.widget('ui.dialog', $.ui.dialog, {
    options: {
        // Determine if clicking outside the dialog shall close it
        clickOutside: false,
        // Element (id or class) that triggers the dialog opening 
        clickOutsideTrigger: ''
    },
    open: function() {
        var clickOutsideTriggerEl = $(this.options.clickOutsideTrigger),
            that = this;
        if (this.options.clickOutside) {
            // Add document wide click handler for the current dialog namespace
            $(document).on('click.ui.dialogClickOutside' + that.eventNamespace, function(event) {
                var $target = $(event.target);
                if ($target.closest($(clickOutsideTriggerEl)).length === 0 &&
                    $target.closest($(that.uiDialog)).length === 0) {
                    that.close();
                }
            });
        }
        // Invoke parent open method
        this._super();
    },
    close: function() {
        // Remove document wide click handler for the current dialog
        $(document).off('click.ui.dialogClickOutside' + this.eventNamespace);
        // Invoke parent close method 
        this._super();
    },
});

/* BOUFFE */

(function () {
	let status = [];

	let renderStatus = function () {

		$('#status_list').html('');

		for (let i = 0; i < status.length; i++) {

			let statusDiv = $(
				'<div class="status">' +
					'<div class="status_inner">' +
						'<div class="status_val"></div>' +
					'</div>' +
				'</div>');

			statusDiv.find('.status_inner')
				.css({ 'border': '1px solid ' + status[i].color })
				;

			statusDiv.find('.status_val')
				.css({
					'background-color': status[i].color,
					'width': (status[i].val) + '%'
				})
				;

			$('#status_list').append(statusDiv);
		}

	};

	window.onData = function (data) {
		if (data.update) {
			status.length = 0;

			for (let i = 0; i < data.status.length; i++) {
				status.push(data.status[i]);
			}

			renderStatus();
		}

		$('#status_list').css({ 'opacity': 0.7 });
	};

	window.onload = function (e) {
		window.addEventListener('message', function (event) {
			onData(event.data);
		});
	};

})();