require_relative "questions_database"

class Question

    attr_accessor :title, :body, :questioner_id
    attr_reader :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = ?
        SQL
        Question.new(data.first)
    end

    def self.find_by_questioner_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.questioner_id = ?
        SQL
        data.map { |datum| Question.new(datum) }
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

    def initialize(options)
        @id = options['id'] #??? " or ' ?
        @title = options['title']
        @body = options['body']
        @questioner_id = options['questioner_id']
    end

    def save
        if self.id
            QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.questioner_id, self.id)
                UPDATE 
                    questions
                SET 
                    title = ?,
                    body = ?,
                    questioner_id = ?
                WHERE
                    questions.id = ?
            SQL
        else
            QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.questioner_id)
                INSERT INTO
                    questions(title, body, questioner_id)
                VALUES
                    (?, ?, ?)
            SQL

            self.id = QuestionsDatabase.instance.last_insert_row_id
        end
    end

    def questioner
        User.find_by_id(self.questioner_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollow.followers_for_question_id(self.id)
    end
    
    def likers
        QuestionLike.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(self.id)
    end


    private
    attr_writer :id
end