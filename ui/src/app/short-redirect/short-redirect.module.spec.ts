import { ShortRedirectModule } from './short-redirect.module';

describe('ShortRedirectModule', () => {
  let shortRedirectModule: ShortRedirectModule;

  beforeEach(() => {
    shortRedirectModule = new ShortRedirectModule();
  });

  it('should create an instance', () => {
    expect(shortRedirectModule).toBeTruthy();
  });
});
