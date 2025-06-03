import React from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";

import AdminDashboard from "./pages/AdminDashboard.jsx";
import UploadBlog from "./pages/UploadBlog.jsx"; // ✅ Add this import
import BlogList from "./pages/BlogList.jsx";
import Contacts from "./pages/Contact.jsx";
import Subscribers from "./pages/Subscribers.jsx";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/admin" element={<AdminDashboard />} />
        <Route path="/upload-blog" element={<UploadBlog />} />{" "}
        <Route path="/contact-list" element={<Contacts />} />{" "}
        <Route path="/subscriber-list" element={<Subscribers />} />{" "}
        <Route path="/blog-list" element={<BlogList />} /> {/* ✅ New Route */}
        <Route path="/" element={<Navigate to="/admin-dashboard" replace />} />
      </Routes>
    </Router>
  );
};

export default App;
