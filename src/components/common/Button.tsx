import React from 'react';

interface AccessibleButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  label: string;
  icon?: React.ReactNode;
}

export const AccessibleButton: React.FC<AccessibleButtonProps> = ({
  label,
  icon,
  ...props
}) => {
  return (
    <button
      {...props}
      aria-label={label}
      className={`accessible-button ${props.className || ''}`}
    >
      {icon && <span className="button-icon" aria-hidden="true">{icon}</span>}
      <span className="button-text">{label}</span>
    </button>
  );
}; 