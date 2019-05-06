$PATH1="./mddrive.xml"
$PATH2="./result.txt"
class Task1
   @bad_chars=["/","?","!"]
   @good_chars=["<",">"]
   def read()
      File.open($PATH1, 'r') do |file|
            file.each_line do |line|
              if line
                  check_str(line)
              end
          end
      end
end

def initialize
  @mass=Array.new()
  @count=Array.new()
end
def count
  @count
end
def mass
  @mass
end
   def check_str(str)
       str.slice! "    ";
       str.each_char do |x|
       if x==" "
        str.slice! x
       end
       if x=="<"
        break
       end
       end
           if str && str[str.length-3] !='/' && str[1]!="/" && str[1]!="?" && str[1]!="!" && str[0]=="<"
            str=str.split(" ")[0].delete("<").delete(">")
            unless @mass.include? str
              @mass.push str
            end

            @count[@mass.find_index str]=@count[@mass.find_index str].to_i+1
           end
end
end

File.open($PATH2, "w") do |file|
  task=Task1.new
  task.read
  task.mass.each do |elem|
    file.write elem+" "+task.count[task.mass.find_index elem].to_s+"\n"

  end

  end