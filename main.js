var index = {
    action: function () {
        $.ajax({
            url: "assets/api/get_programme.php",
            type: 'GET'
        }).done(function (data) {
            console.log(data);
            index.render(data);
        });
    },
    render: function (data) {
        render_template("assets/templates/index.html", "_index", "#charge", {
            "diffusion": data.html
        });
    }
};
$(function () {
    render_template("maintemplate.html", "_maintemplate", "#content");
    index.action();
});