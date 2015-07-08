getal = 1

while getal < 1000
	ispriem = true
	denom = 2

	while denom < getal

		if getal % denom == 0
		ispriem = false
		break
		end

		denom = denom+1

	end

	if ispriem
		puts "jup a prime" + getal.to_s

	else



	end
	getal = getal + 1
end
