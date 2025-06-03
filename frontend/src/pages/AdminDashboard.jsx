import React from "react";

const AdminDashboard = () => {
  return (
    <main
      style={{ padding: "40px", background: "#f8f9fa", minHeight: "100vh" }}
    >
      <h1 style={{ color: "#333", marginBottom: "2rem" }}>
        Dashboard Overview
      </h1>

      <section id="blog" style={sectionStyle}>
        <h2 style={sectionTitle}>📰 Blog Posts</h2>
        <p>View, create, and manage blog content for your site.</p>
      </section>

      <section id="contacts" style={sectionStyle}>
        <h2 style={sectionTitle}>📬 Contact Messages</h2>
        <p>Review and respond to messages sent through your contact form.</p>
      </section>

      <section id="subscriptions" style={sectionStyle}>
        <h2 style={sectionTitle}>📩 Newsletter Subscriptions</h2>
        <p>Manage email subscribers for your organization's updates.</p>
      </section>
    </main>
  );
};

// 💅 Section Styling
const sectionStyle = {
  background: "#fff",
  borderRadius: "8px",
  padding: "20px",
  marginBottom: "30px",
  boxShadow: "0 2px 8px rgba(0, 0, 0, 0.05)",
};

const sectionTitle = {
  marginBottom: "10px",
  color: "#007bff",
};

export default AdminDashboard;
