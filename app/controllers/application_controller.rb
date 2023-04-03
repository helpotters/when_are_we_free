class ApplicationController < ActionController::Base
  def render_flash
    turbo_stream_update('flash', partial: 'shared/flash')
    render turbo_stream: actions
  end

  def update_friends
    turbo_stream_update('friends', action: 'prepend', partial: 'events/friends_joined')
    turbo_stream_update('flash', partial: 'shared/flash')
    turbo_stream_update('votes', partial: 'events/event_info')
    turbo_stream_update('forms', partial: 'voters/notify')
    render turbo_stream: actions
  end

  def turbo_stream_update(key, component)
    @turbo_stream_actions ||= []
    @turbo_stream_actions << turbo_stream.update(key, view_context.render(component))
  end

  def actions
    @turbo_stream_actions
  end
end
