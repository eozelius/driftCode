module ApiHelper
	def init_driftmap(json)
		driftmap = params[:map].to_json


		driftmap.each do |attr|
			if attr.nil?
				return error_msg
			end
		end



			array.each do |element|
			  element.do_stuff
			end
	end




end
