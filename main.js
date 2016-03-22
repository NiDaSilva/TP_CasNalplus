var index = {
    action: function () {
        $.ajax({
            url: "assets/api/get_chaine.php",
            type: 'GET'
        }).done(function (data) {
            Chaine.allChaine = JSON.parse(data);
            $.ajax({
                url: "assets/api/get_programme.php",
                type: 'GET'
            }).done(function (data) {
                Programme.allProgramme = JSON.parse(data);
                index.render();
            });
        });
    },
    render: function () {
        console.log(Chaine.allChaine);
        console.log(Programme.allProgramme);
        render_template("assets/templates/index.html", "_index", "#charge", {
            "ch": Chaine.allChaine,
            "pro": Programme.allProgramme
        });
    }
};
$(function () {
    render_template("maintemplate.html", "_maintemplate", "#content");
    index.action();
});