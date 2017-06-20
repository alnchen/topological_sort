require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  in_edge_counts = {}
  queue = []
  sorted = []

  vertices.each do |vertex|
    in_edge_counts[vertex] = vertex.in_edges.count
    queue.push(vertex) if vertex.in_edges.empty?
  end

  until queue.empty?
    cur = queue.shift
    sorted.push(cur)

    cur.out_edges.each do |edge|
      in_edge_counts[edge.to_vertex] -= 1
      queue.push(edge.to_vertex) if in_edge_counts[edge.to_vertex] == 0
    end
    
  end

  sorted
end
