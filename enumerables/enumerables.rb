class Array
    def my_each(&prc)
        self.each_index do |idx|
            prc.call(self[idx])
        end
        self
    end

    def my_select(&prc)
        selected = Array.new
        self.my_each do |el|
            selected.push(el) if prc.call(el)
        end
        selected
    end

    def my_reject(&prc)
        rejected = Array.new
        self.my_each do |el|
            rejected.push(el) unless prc.call(el)
        end
        rejected
    end

    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |el|
            return false unless prc.call(el)
        end 
        true 
    end

    def my_flatten
        new_array = Array.new 
        self.each do |ele|
            if ele.is_a?(Array)
                new_array += ele.my_flatten 
            else 
                new_array.push(ele)
            end 
        end 
        new_array 
    end 

    def my_zip(*arrays)
        zipped_array = Array.new
        self.each_with_index do |ele, idx|
            sub_array = [ele]
            arrays.each do |array|
                sub_array.push(array[idx])
            end
            zipped_array.push(sub_array)
        end
        zipped_array 
    end 

    def my_rotate(shift=1)
        shift == 1 ? shift : shift = shift % self.length
        self.drop(shift) + self.take(shift)
    end

    def my_join(separator="")
        joined = ""
        self.each do |ele|
            joined += (ele == self.last ? ele : ele + separator)
        end
        joined
    end

    def my_reverse
        return self if self.length <= 1
        self.drop(1).my_reverse << self.first
    end

    def my_reverse2 
        return self if self.length <= 1 
        reverse_array = Array.new 
        i = self.length - 1
        while i >= 0 
            reverse_array.push(self[i])
            i-=1
        end
        reverse_array 
    end 

    def bubble_sort!(&prc)
        prc ||= Proc.new { |a,b| a <=> b}
        sorted = false
        until sorted == true
            sorted = true
            self.each_index do |i|
                j = i+1
                next if j == self.length
                if prc.call(self[i],self[j]) == 1
                    self[i], self[j] = self[j], self[i]
                    sorted = false
                end
            end 
        end
        self 
    end

    def bubble_sort(&prc)
        new_array = self.dup
        prc ||= Proc.new { |a,b| a <=> b}
        sorted = false
        until sorted
            sorted = true
            new_array.each_index do |i|
                j = i+1
                next if j == new_array.length
                if prc.call(new_array[i],new_array[j]) == 1
                    new_array[i],new_array[j] = new_array[j],new_array[i]
                    sorted = false
                end
            end
        end
        new_array
    end
end

def factors(number)
    factors = Array.new 
    i = number 
    while i > 0 
        if number % i == 0 
            factors.push(i)
        end
        i-=1
    end 
    factors.sort
end 


def factors2(num)
    (1..num).select { |n| num % n == 0}
end

def substrings(string)
    subs = Array.new
    string.chars.each_index do |i|
        string.chars.each_index do |j|
            next if i > j
            subs << string[i..j]
        end
    end
    subs.uniq
end

def subwords(string, dictionary)
    words = dictionary.select{|word|string.include?(word)}
end 

