require './helper'

TextMessage = require('hubot/src/message').TextMessage

describe 'cat.coffee', ->  
  {robot, user, adapter} = {}

  shared_context.robot_is_running (ret) ->
    {robot, user, adapter} = ret

  beforeEach ->
    require('../scripts/cat.coffee')(robot)

  it 'should be string when called hubot cat', (done) ->
    adapter.on 'send', (envelope, strings) ->
      expect(strings[0]).to.be.a('string')
    , done

    adapter.receive(new TextMessage(user, 'hubot cat'))
