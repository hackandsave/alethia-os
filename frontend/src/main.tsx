import React from 'react';
import ReactDOM from 'react-dom/client';

// This is a placeholder for our full app.
// In a real build, all the logic from our altheia.html script would be
// refactored into React components here.
const App = () => {
  return (
    <div style={{ fontFamily: 'sans-serif', padding: '2rem' }}>
      <header>
        <h1>Aletheia OS</h1>
        <p>Welcome. Your application is successfully deployed.</p>
      </header>
      <main>
        <p>The full Identity Protocol and Dashboard would be built here as React components.</p>
        <p>This structure is now ready for professional development.</p>
      </main>
    </div>
  );
};

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
