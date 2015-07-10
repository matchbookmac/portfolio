require "rails_helper"

describe Post do
  it { should validate_presence_of :content }

  it { should belong_to :user }
  it { should belong_to :post }
  it { should have_many :posts }

  describe ".not_comments" do
    it "will return an array of posts that are not comments" do
      posts = []
      comments = create(:comments)
      posts.push(create(:post))
      posts.push(create(:post))
      posts.push(create(:post))
      expect(Post.not_comments).to eq(posts)
    end
  end
end
