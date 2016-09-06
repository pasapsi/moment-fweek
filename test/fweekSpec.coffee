describe "Fiscal weeks with start in september", ->
  it "1st september is W1", ->
    expect(moment("2016-09-01").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-09-01").fweek(9).toString()).toEqual("W1 2016/17")
  it "2st september is W1", ->
    expect(moment("2016-09-02").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-09-02").fweek(9).toString()).toEqual("W1 2016/17")
  it "31 august is W1 of next year", ->
    expect(moment("2016-08-31").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-08-31").fweek(9).toString()).toEqual("W1 2016/17")
  it "29 august is W1 of next year", ->
    expect(moment("2016-08-29").fweek(9)).toEqual({week: 1, year: 2016, nextYear: 2017, start: "2016-08-29", end: "2016-09-04"})
    expect(moment("2016-08-29").fweek(9).toString()).toEqual("W1 2016/17")
  it "28 august is W52", ->
    expect(moment("2016-08-28").fweek(9)).toEqual({week: 52, year: 2015, nextYear: 2016, start: "2016-08-22", end: "2016-08-28"})
    expect(moment("2016-08-28").fweek(9).toString()).toEqual("W1 2015/16")
  it "1st september is W1", ->
    expect(moment("2015-09-01").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-09-01").fweek(9).toString()).toEqual("W1 2016/17")
  it "2st september is W1", ->
    expect(moment("2015-09-02").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-09-02").fweek(9).toString()).toEqual("W1 2016/17")
  it "31 august is W1 of next year", ->
    expect(moment("2015-08-31").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-08-31").fweek(9).toString()).toEqual("W1 2016/17")
  it "29 august is W1 of next year", ->
    expect(moment("2015-08-29").fweek(9)).toEqual({week: 1, year: 2015, nextYear: 2016, start: "2015-08-31", end: "2015-09-06"})
    expect(moment("2015-08-29").fweek(9).toString()).toEqual("W1 2016/17")
  it "28 august is W52", ->
    expect(moment("2015-08-28").fweek(9)).toEqual({week: 52, year: 2014, nextYear: 2015, start: "2016-08-23", end: "2016-08-30"})
    expect(moment("2015-08-28").fweek(9).toString()).toEqual("W52 2014/15")
  it "1st september 2017 is W52", ->
    expect(moment("2017-09-01").fweek(9)).toEqual({week: 52, year: 2016, nextYear: 2017, start: "2017-08-28", end: "2017-09-03"})
    expect(moment("2017-09-01").fweek(9).toString()).toEqual("W52 2016/17")

describe "Moment date should not change", ->
  it "should not change original moment date object", ->
    testDate = moment("2015-01-01")
    testDate.fweek()
    expect(testDate.format("YYYY-MM-DD")).toEqual("2015-01-01")