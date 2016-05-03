class CourseStatus < EnumerateIt::Base
  associate_values(
    inactive: [0, 'Inactive'],
    active:   [1, 'active']
  )
end
