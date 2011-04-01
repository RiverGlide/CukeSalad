in_order_to "CreateAFile", at: :path, containing: :content do
  write_file( the(:path), the(:content ))
end
