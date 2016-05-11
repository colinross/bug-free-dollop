def tag_image(image_id, tag)
  `docker tag #{image_id} #{tag}`
end

def build_image(dockerfile, context=".")
  `docker build -f #{dockerfile} #{context}`
end
