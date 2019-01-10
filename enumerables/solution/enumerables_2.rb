class Array
    
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        select = []
        self.my_each do |item|
            select << item if prc.call(item)
        end
        select
    end

    def my_reject(&prc)
        select = []
        self.my_each do |item|
            select << item unless prc.call(item)
        end
    end

    def my_any?(&prc)
        self.my_each do |item|
            return true if prc.call(item)
        end
    end

    def my_all?(&prc)
        self.my_each do |item|
            return false unless prc.call(item)
        end
        true
    end

    def my_flatten
        flattened_array = []

        self.my_each do |el|
            if el.is_a?(Array)
                flattened_array.concat(el.my_flatten)
            else
                flattened_array << el
            end
        end
        flattened_array
    end

    def my_zip(*arrays)
        zipped_array = []

        self.each_with_index do |el, idx|
            sub_array = [el]
            arrays.each do |array|
                sub_array.push(array[idx])
            end
            zipped_array.push(sub_array)
        end
        zipped_array
    end

    def my_rotate(positions = 1)
        shift = positions % self.length
        self.drop(shift) + self.take(shift)
    end

    def my_join(separator = "")
        new_string = ""

end