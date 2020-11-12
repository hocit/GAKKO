(function ($) {
    $(function () {
        var target = $(".c-form");
        var validate = target.inputfollow({
            rules: {
                cont: { type: "required" },
                name: { type: "required" },
                furi: { type: "required" },
                company: { type: "required" },
                zip1: [{ type: "required" }, { type: "number" }],
                zip2: [{ type: "required" }, { type: "number" }],
                pref: { type: "required" },
                address1: { type: "required" },
                address2: { type: "required" },
                mail: [{ type: "required" }, { type: "email" }],
                tel1: [{ type: "required" }, { type: "number" }],
                tel2: [{ type: "required" }, { type: "number" }],
                tel3: [{ type: "required" }, { type: "number" }],
                body: { type: "required" },
                personal: { type: "required" },
            },
        });
        validate.set_on_validate(function () {
            // if (validate.get_errors() > 0) {
            // } else {
            // }
        });
        validate.validate_all();
    });
})(jQuery);
