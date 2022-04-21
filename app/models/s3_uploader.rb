class S3Uploader
  def call
    aws_credentials = Aws::Credentials.new('AKIAVYRWVVBNZWH2XJFV','XEvOXZrgaD7fEusv1hUtVl4MV421TzZS5oDU4LI8')
    aws_resource = Aws::S3::Resource.new(credentials: aws_credentials, region: 'us-east-1')
    
    bucket = aws_resource.bucket('tempimages')
    bucket.objects.each do |obj|
      debugger
    end
  end
end