# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  values = (1..arr.flatten.max).to_a
  vertices = values.map { |val| Vertex.new(val) }

  arr.each do |tuple|
    dependency = vertices[tuple[1] - 1]
    package = vertices[tuple[0] - 1]
    Edge.new(dependency, package)
  end

  topological_sort(vertices).map(&:value)
end
