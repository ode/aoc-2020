function main(default)
  pos, dir = 0, default
  dirs, rot = ['N', 'W', 'S', 'E'], ['R', 'L']
  # these arrays are staggered because julia indexes from 1
  op = '.'
  findin(x) = findfirst(isequal(op), x)
  for line in readlines("12.txt")
    op, num = line[1], parse(Int64, line[2:end])
    if op in dirs
      if default == 1
        pos += num * im^findin(dirs)
      else
        dir += num * im^findin(dirs)
      end
    elseif op in rot
      dir *= im^(4 + (-1)^findin(rot) * num ÷ 90) 
      # adding four because negative powers are float
    else
      pos += dir * num
    end
  end
  pos
end
manhattan(x) = abs(x.im) + abs(x.re)
println(manhattan(main(1))," ",manhattan(main(10 + im)))
