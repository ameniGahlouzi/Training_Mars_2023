import React, { useState, useEffect } from 'react';

function Article() {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    fetch('http://localhost:8080')
      .then(response => response.json())
      .then(data => setArticles(data));
  }, []);

  return (
    <div>
      <h1>Articles</h1>
      <ul>
        {articles.map(article => (
          <li key={article.id}>
            {article.id}: {article.name}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Article;
