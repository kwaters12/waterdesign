# module S3DirectUpload
#   module UploadHelper
#     class S3Uploader
#       def url
#         "http#{@options[:ssl] ? 's' : ''}://#{@options[:bucket]}.#{@options[:region]}.amazonaws.com/"
#       end
#     end
#   end
# end