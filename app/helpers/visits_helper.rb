module VisitsHelper
  def visits_over_time_line_graph_for(user)
    visits = user.visits.order :created_at

    x = visits.map { |v| (v.created_at - visits.first.created_at).to_i }
    y = (1..visits.count).to_a

    image_tag "http://chart.apis.google.com/chart?chs=300x100&cht=lxy&chds=0,#{x.max},0,#{y.max}&chd=t:#{x.join(',')}|#{y.join(',')}&chxr=0,0,#{visits.count}&chxt=y"
  end
end
