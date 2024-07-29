class Object

	def querify
		if self.is_a? String
			return self.gsub(/,\s?/, "%2C").gsub(" ", "+")
		elsif self.is_a? Array
			return self.join("%2C").gsub(" ", "+")
		elsif self.is_a? Hash
			result = []
			self.each do |key, value|
				result << "#{key.to_s.to_camel_case}=#{value.querify}"
			end
			return result.join("&")
		else
			return self
		end
	end

	def to_camel_case
		self.chars.length.times do |i|
			if self[i] == "_"
				self[i+1] = self[i+1].upcase
			end
		end
		return self.delete "_"
	end

end