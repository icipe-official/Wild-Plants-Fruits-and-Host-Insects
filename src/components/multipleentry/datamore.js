import { useLocation } from 'react-router-dom';
export default function DetailPage() {
  const location = useLocation();
  const { data } = location.state || {};

  return (
    <div>
      <h1>Detail Page</h1>
      {data ? (
        <div>
          <h2>Data from previous page:</h2>
          <pre>{JSON.stringify(data, null, 2)}</pre>
        </div>
      ) : (
        <div>No data found from previous page.</div>
      )}
    </div>
  );
}