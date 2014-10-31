proxy  = do require('proxyquire').noCallThru
assert = require 'assert'
path   = require 'path'

stats = require '../src/modules/stats.coffee'

module.exports =

  'stats - is milestone empty, on time and overdue? no due date': (done) ->
    milestone =
      'issues':
        'open': { 'size': 0 }
        'closed': { 'size': 0 }

    { isEmpty, isOverdue, isOnTime } = stats milestone
    assert.equal isEmpty, yes
    assert.equal isOverdue, no
    assert.equal isOnTime, yes
    do done

  'stats - is milestone done?': (done) ->
    milestone =
      'issues':
        'open': { 'size': 0 }
        'closed': { 'size': 5 }

    { isDone } = stats milestone
    assert.equal isDone, yes
    do done

  'stats - is milestone overdue? has due date': (done) ->
    milestone =
      'due_on': 0
      'issues':
        'open': { 'size': 0 }
        'closed': { 'size': 0 }

    { isOverdue } = stats milestone
    assert.equal isOverdue, yes
    do done

  'stats - is milestone on time? has due date, yes': (done) ->
    now = +new Date

    milestone =
      'created_at': now - 1e3
      'due_on': 1e4 + now
      'issues':
        'open': { 'size': 1 }
        'closed': { 'size': 1 }

    { isOnTime } = stats milestone
    assert.equal isOnTime, yes
    do done

  'stats - is milestone on time? has due date, no': (done) ->
    now = +new Date

    milestone =
      'created_at': now - 1e4
      'due_on': 1e3 + now
      'issues':
        'open': { 'size': 1 }
        'closed': { 'size': 1 }

    { isOnTime } = stats milestone
    assert.equal isOnTime, no
    do done