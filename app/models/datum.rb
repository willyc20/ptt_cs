class Datum < ActiveRecord::Base

  # state
  # -1 沒用
  # 0 未讀
  # 1 已讀
  # 2 待讀清單
  # 3 收藏

  def self.init
    category = ['algorithm', 'data', 'discrete', 'linear', 'operating', 'organization', 'other']
    
    category.each_with_index do |t, i|
      a = File.open("cs/#{t}", 'r').read

      b = a.split("\n")
      b = (0..(b.size/4-1)).map do |j|
        [b[j*4],b[j*4+1],b[j*4+2],b[j*4+3]]
      end
     
      b.each do |s|
        Datum.create(:href => s[0], :title => s[1], :author => s[3], :create => s[2], :category => i, :state => 0)
      end
    end

  end

end
