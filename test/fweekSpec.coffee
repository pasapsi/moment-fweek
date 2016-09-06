describe "Fiscal weeks with start in september", ->
  it "1st september 2016 is W1", ->
    expect(moment("2016-09-01").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-09-01").fweek(9).toString()).toEqual("W1 2016/17")
  it "2st september 2016 is W1", ->
    expect(moment("2016-09-02").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-09-02").fweek(9).toString()).toEqual("W1 2016/17")
  it "31 august 2016 is W1 of next year", ->
    expect(moment("2016-08-31").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-08-31").fweek(9).toString()).toEqual("W1 2016/17")
  it "29 august 2016 is W1 of next year", ->
    expect(moment("2016-08-29").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-08-29").fweek(9).toString()).toEqual("W1 2016/17")
  it "28 august 2016 is W53", ->
    expect(moment("2016-08-28").fweek(9)).toEqual({week: 53, year: 2015, nextYear: 2016, start: "2016-08-22", end: "2016-08-28"})
    expect(moment("2016-08-28").fweek(9).toString()).toEqual("W53 2015/16")
  it "1st september 2015 is W1", ->
    expect(moment("2015-09-01").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-09-01").fweek(9).toString()).toEqual("W1 2015/16")
  it "2st september 2015 is W1", ->
    expect(moment("2015-09-02").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-09-02").fweek(9).toString()).toEqual("W1 2015/16")
  it "31 august 2015 is W1 of next year", ->
    expect(moment("2015-08-31").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-08-31").fweek(9).toString()).toEqual("W1 2015/16")
  it "29 august 2015 is W52", ->
    expect(moment("2015-08-29").fweek(9)).toEqual({week: 52, year: 2014, nextYear: 2015, start: "2015-08-24", end: "2015-08-30"})
    expect(moment("2015-08-29").fweek(9).toString()).toEqual("W52 2014/15")
  it "28 august 2015 is W52", ->
    expect(moment("2015-08-28").fweek(9)).toEqual({week: 52, year: 2014, nextYear: 2015, start: "2015-08-24", end: "2015-08-30"})
    expect(moment("2015-08-28").fweek(9).toString()).toEqual("W52 2014/15")
  it "1st september 2017 is W52", ->
    expect(moment("2017-09-01").fweek(9)).toEqual({week: 52, year: 2016, nextYear: 2017, start: "2017-08-28", end: "2017-09-03"})
    expect(moment("2017-09-01").fweek(9).toString()).toEqual("W52 2016/17")
  it "4st september 2017 is W1", ->
    expect(moment("2017-09-04").fweek(9)).toEqual({week: 1, year: 2017, nextYear: 2018, start: "2017-09-04", end: "2017-09-10"})
    expect(moment("2017-09-04").fweek(9).toString()).toEqual("W1 2017/18")


describe "Moment date should not change", ->
  it "should not change original moment date object", ->
    testDate = moment("2015-01-01")
    testDate.fweek()
    expect(testDate.format("YYYY-MM-DD")).toEqual("2015-01-01")