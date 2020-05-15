# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

ActiveRecord::Base.transaction do

 User.destroy_all
 Artwork.destroy_all
 ArtworkShare.destroy_all
 Comment.destroy_all
 
 u1 = User.create!(username: 'Markov')
 u2 = User.create!(username: 'Van Gogh')
 u3 = User.create!(username: 'Ashe')
 u4 = User.create!(username: 'Okey')
 u5 = User.create!(username: 'Leonardo Da Vinci')
 
 a1 = Artwork.create!(title: "Mona Lisa", image_url: "monalisa.com", artist_id: u5.id )
 a2 = Artwork.create!(title: "SQL is hard", image_url: "sql.com", artist_id: u3.id )
 a3 = Artwork.create!(title: "Naked Lunch", image_url:"naked_lunch.aa", artist_id: u1.id)
 a4 = Artwork.create!(title: "Starry Night", image_url:"starry_night.com", artist_id: u2.id)
 
 as1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u3.id)
 as2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u3.id)
 as3 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: u3.id)
 as4 = ArtworkShare.create!(artwork_id: a4.id, viewer_id: u3.id)
 as5 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u4.id)
 as6 = ArtworkShare.create!(artwork_id: a4.id, viewer_id: u4.id)

 c1 = Comment.create!(user_id: u3.id, artwork_id: a4.id , body: "I flew all the way to NYC for you, and can stare at you all day.")
 c2 = Comment.create!(user_id: u3.id, artwork_id: a1.id , body: "I'm so jealous of French people.")
 c3 = Comment.create!(user_id: u5.id, artwork_id: a4.id, body: "This is ridiculous. No reality at all. Yet it's beautiful!")
 c4 = Comment.create!(user_id: u4.id, artwork_id: a2.id, body: "I totally feel your pain!" )
 c5 = Comment.create!(user_id: u2.id, artwork_id: a3.id, body: "..you sold art for money. I won't do it.")
 c6 = Comment.create!(user_id: u4.id, artwork_id: a4.id , body: "Starry Night is a good painting!")
 c7 = Comment.create!(user_id: u2.id, artwork_id: a3.id , body: "Van Gogh paintings are great!")

 l1 = Like.create!(user_id: u3.id, likeable_type: "Comment", likeable_id: c1.id)
 l2 = Like.create!(user_id: u3.id, likeable_type: "Comment", likeable_id: c2.id)
 l3 = Like.create!(user_id: u5.id, likeable_type: "Comment", likeable_id: c3.id)
 l4 = Like.create!(user_id: u4.id, likeable_type: "Comment", likeable_id: c4.id )
 l5 = Like.create!(user_id: u2.id, likeable_type: "Artwork", likeable_id: a1.id)
 l6 = Like.create!(user_id: u4.id, likeable_type: "Artwork", likeable_id: a2.id)
 l7 = Like.create!(user_id: u2.id, likeable_type: "Artwork", likeable_id: a4.id)

end

# create_table "likes", force: :cascade do |t|
#     t.integer "user_id"
#     t.string "likeable_type"
#     t.bigint "likeable_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
#   end