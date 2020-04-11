json.array!(@events) do |event|
  json.title event.part
  json.start event.start
  json.url event_url(event, format: :html)
end