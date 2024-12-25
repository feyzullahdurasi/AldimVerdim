import React, { useState } from 'react';

interface OnboardingStep {
  title: string;
  description: string;
  image: string;
}

const steps: OnboardingStep[] = [
  {
    title: 'Uygulamaya Hoş Geldiniz',
    description: 'Size yardımcı olmak için buradayız',
    image: '/assets/welcome.png'
  },
  // Diğer adımlar...
];

export const OnboardingScreen: React.FC = () => {
  const [currentStep, setCurrentStep] = useState(0);

  return (
    <div className="onboarding-container">
      <div className="step-content">
        <h1>{steps[currentStep].title}</h1>
        <p>{steps[currentStep].description}</p>
        <img src={steps[currentStep].image} alt="Onboarding" />
      </div>
      <div className="navigation">
        {currentStep > 0 && (
          <button onClick={() => setCurrentStep(prev => prev - 1)}>Geri</button>
        )}
        <button onClick={() => setCurrentStep(prev => prev + 1)}>
          {currentStep === steps.length - 1 ? 'Başla' : 'İleri'}
        </button>
      </div>
    </div>
  );
}; 