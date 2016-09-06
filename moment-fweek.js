// moment-fweek.js
// version : 0.1
// author : Yuri Yurin
// license : MIT
// github.com/yujj/moment-fweek

(function () {

    function onload(moment) {
        moment.fn.fweek = function (startMonth) {
            var thisDate = this.clone();
            var initial = thisDate.local()._week || "W";
            var result = {}, adjustedDate, nextYear = null;
            startMonth = startMonth || 4; // default is April
            var originalDate = this.clone();

            if (startMonth > 1) {
                adjustedDate = thisDate.subtract(startMonth - 1, "months");
                nextYear = adjustedDate.clone().add(1, "years");
            } else {
                adjustedDate = thisDate;
            }
            if (startMonth < 0) {
                adjustedDate = thisDate.subtract(12 + startMonth, "month").add(1, "year");
                nextYear = adjustedDate.clone().add(1, "year");
            } else {
                adjustedDate = thisDate;
            }

            result.week = adjustedDate.isoWeek();
            result.year = adjustedDate.year();
            result.nextYear = (nextYear) ? nextYear.year() : nextYear;
            result.start = originalDate.set("date", 1).subtract((originalDate.month() + 12) % 3, "months").format("YYYY-MM-DD");
            result.end = originalDate.set("date", 1).subtract((originalDate.month() + 12) % 3, "months").add(3, "months").subtract(1, "day").format("YYYY-MM-DD");

            result.toString = function () {
                var str = initial + result.week + " " + result.year;
                return (nextYear) ? str + "/" + nextYear.format("YY") : str;
            };

            return result;
        };

        return moment;
    }

    if (typeof define === "function" && define.amd) {
        define("moment-fweek", ["moment"], onload);
    } else if (typeof module !== "undefined") {
        module.exports = onload(require("moment"));
    } else if (typeof window !== "undefined" && window.moment) {
        onload(window.moment);
    }

}).apply(this);