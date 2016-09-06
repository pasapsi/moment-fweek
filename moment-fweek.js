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
            var result = {};
            startMonth = startMonth || 4; // default is April
            var originalDate = this.clone();
            var firstWeekOfYear = this.clone().isoWeek(1).startOf('isoWeek');
            var startOfFiscalYear = this.clone().startOf('month').month(startMonth - 1);
            var isoWeekDay = startOfFiscalYear.isoWeekday();
            if (isoWeekDay > 4) {
                startOfFiscalYear.add(7, 'day');
            }

            var firstWeekOfFiscalYear = startOfFiscalYear.startOf('isoWeek');
            var diffDays = firstWeekOfFiscalYear.diff(firstWeekOfYear, 'days');
            var adjustedDateWeek = this.clone().subtract(diffDays, 'day');


            // console.log(firstWeekOfYear.format(), isoWeekDay, startOfFiscalYear.isoWeekday(), firstWeekOfFiscalYear.format(), diffDays, adjustedDateWeek.format());

            result.week = adjustedDateWeek.isoWeek();
            result.year = adjustedDateWeek.isoWeekYear();


            result.nextYear = adjustedDateWeek.isoWeekYear() + 1;
            result.start = originalDate.startOf('isoWeek').format("YYYY-MM-DD");
            result.end = originalDate.endOf('isoWeek').format("YYYY-MM-DD");

            result.toString = function () {
                var str = initial + result.week + " " + result.year;
                return str + "/" + moment().year(adjustedDateWeek.isoWeekYear() + 1).format('YY');
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