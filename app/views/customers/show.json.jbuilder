json.array!(@events) do |event|
  json.title event.part_i18n
  json.start event.start
  json.url event_url(event, format: :html)
end